package CODE.DependencyInjectionExample;

public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public String findCustomerById(int id) {
        return "Customer{id=" + id + ",name ='Jhonny'}";
    }
}